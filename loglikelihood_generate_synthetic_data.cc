﻿/* * Project     : HLib * File        : bem1d.c * Description : example for 1d BEM problem * Author      : Ronald Kriemann * Copyright   : Max Planck Institute MIS 2004-2014. All Rights Reserved. * */#include <iostream>#include <fstream>#include <vector>#include <boost/format.hpp>#include <boost/math/special_functions/gamma.hpp>#include <boost/math/special_functions/bessel.hpp>#include <gsl/gsl_sf_bessel.h>#include <gsl/gsl_sf_gamma.h>#include <hlib.hh>//#include <solve_types.hh>using namespace std;using namespace HLIB;using boost::format;using HLIB::Time::Wall::now;using HLIB::Time::Wall::since;using real_t = HLIB::real;int global_k;double global_eps;double l1, l2;double step_h;int nmin;template < typename T >stringmem_per_dof ( T && A ){    const size_t  mem  = A->byte_size();    const size_t  pdof = size_t( double(mem) / double(A->rows()) );    return Mem::to_string( mem ) + " (" + Mem::to_string( pdof ) + "/dof)";}double compute_Bessel ( double  d,                 double  pho,                 double  nu,                 double  sigma2 ){ //   const double temp =  sqrt(2*nu) * d / pho;   const double temp =  d / pho;    if (d<1e-16)        return sigma2;    else    {        return sigma2 * gsl_sf_bessel_Knu(nu, temp) * std::pow(temp, nu) / std::pow(2.0, nu-1) / gsl_sf_gamma(nu);        // return sigma2 * boost::math::cyl_bessel_k( nu, temp ) * std::pow(temp, nu) / std::pow(2.0, nu-1) / boost::math::tgamma( nu );    }// else}//// covariance coefficient function//class TCovCoeffFn : public TPermCoeffFn< real_t >{private:    const double                _length;    const double                _nu;    const double                _sigma2;    const double                _nugget;    const vector< double * > &  _vertices;public:    // constructor    TCovCoeffFn ( const double               length,                  const double               nu,                  const double               sigma2,                  const double               nugget,                  const vector< double * > & vertices,                  const TPermutation *       row_perm,                  const TPermutation *       col_perm )            : TPermCoeffFn< real_t >( row_perm, col_perm )            , _length( length )            , _nu( nu )            , _sigma2( sigma2 )            , _nugget( nugget )            , _vertices( vertices )    {}    //    // coefficient evaluation    //    virtual void eval  ( const std::vector< idx_t > &  rowidxs,                         const std::vector< idx_t > &  colidxs,                         real_t *                      matrix ) const    {        const size_t  n = rowidxs.size();        const size_t  m = colidxs.size();        for ( size_t  j = 0; j < m; ++j )        {            const idx_t     idx1 = colidxs[ j ];            const double *  y    = _vertices[ idx1 ];                        for ( size_t  i = 0; i < n; ++i )            {                const idx_t     idx0 = rowidxs[ i ];                const double *  x    = _vertices[ idx0 ];                const double    dist = Math::sqrt( Math::square( x[0] - y[0] ) + Math::square( x[1] - y[1] ) );                matrix[ j*n + i ] = compute_Bessel( dist, _length, _nu, _sigma2 );  //                if(j==i)                   //matrix[ j*n + i ] = matrix[ j*n + i ] + _nugget ;                  //if(idx0==idx1)                //    matrix[ j*n + i ] =100;               // else                //    matrix[ j*n + i ] =0;                                }// for        }// for    }    using TPermCoeffFn< real_t >::eval;    //    // return format of matrix, e.g. symmetric or hermitian    //    virtual matform_t  matrix_format  () const { return symmetric; }    };//Use a method described by Abramowitz and Stegun: double gaussrand_Stegun(){    static double U, V;    static int phase = 0;    double Z;    if(phase == 0) {        U = (rand() + 1.) / (RAND_MAX + 2.);        V = rand() / (RAND_MAX + 1.);        Z = sqrt(-2 * log(U)) * sin(2 * M_PI * V);    } else        Z = sqrt(-2 * log(U)) * cos(2 * M_PI * V);    phase = 1 - phase;    return Z;}//Use a method discussed in Knuth and due originally to Marsaglia:double gaussrand_Knuth(){    static double V1, V2, S;    static int phase = 0;    double X;    if(phase == 0) {        do {            double U1 = (double)rand() / RAND_MAX;            double U2 = (double)rand() / RAND_MAX;            V1 = 2 * U1 - 1;            V2 = 2 * U2 - 1;            S = V1 * V1 + V2 * V2;        } while(S >= 1 || S == 0);        X = V1 * sqrt(-2 * log(S) / S);    } else        X = V2 * sqrt(-2 * log(S) / S);    phase = 1 - phase;    return X;}intmain ( int argc, char ** argv ){    INIT();//    char datename[120];        CFG::set_verbosity( 2 );//    string  datename = "c/meshnew/moist_tri512812short.txt";//    string  datename = "c/meshnew/moist_tri16000.txt";  //  if ( argc > 1 )  //      datename = argv[1];        unique_ptr< TProgressBar >  progress( verbose(2) ? new TConsoleProgressBar : nullptr );        //    // read coordinates    //    vector< double * >  vertices;    TScalarVector       rhs;    //TScalarVector       vectorU;    //TScalarVector       vectorC;    int                 dim = 2;    int                 N   = 0;        //string datename="/home/litvina/111gsl/data_ying/WHOLE_DOMAIN_MESHES/Nest_whole_moist_32000_1.txt";    string datename="/home/lit/111gsl/data_ying/moist_tri512812.txt";      cout << datename <<endl;    {        ifstream  in( datename.c_str() );        if ( ! in )        {            cout << "error opening " << datename << endl;            exit( 1 );        }// if        in >> N;        cout << "  reading " << N << " coordinates" << endl;                vertices.resize( N );        rhs.set_size( N );                for ( int  i = 0; i < N; i++ )        {            int     index, property=1;            double  x, y, v=0.0;            in >> index >> x >> y >> property >> v;            //in >> x >> y >> v;            vertices[i] = new double[ dim ];            vertices[i][0] = x;            vertices[i][1] = y;            rhs.set_entry( i, gaussrand_Stegun() );//            rhs.set_entry( i, v );           // printf("%4.4g, %4.4g \n", x, y);        }// for    }            TCoordinate  coord( vertices, dim );        //print_vtk( & coord, "coord" );            //    // clustering    //    HLIB::CFG::Cluster::nmin=64;    TAutoBSPPartStrat   part_strat( adaptive_split_axis );    TBSPCTBuilder       ct_builder( & part_strat );    auto                ct = ct_builder.build( & coord );        TStdGeomAdmCond     adm_cond( 2.0, use_min_diam );    TBCBuilder          bct_builder( std::log2( 16 ) );    auto                bct = bct_builder.build( ct.get(), ct.get(), & adm_cond );    flatten_leaf( bct->root() );        // bring RHS into H-ordering    ct->perm_e2i()->permute( & rhs );        TPSMatrixVis  mvis_struct, mvis_mem;       // mvis_struct.structure( true ).id( true ).svd( false );   // mvis_mem.mem_col( true, "coolwarm" ).structure( false ).svd( false );        double  length = 0.08646;     double  nu     = 0.50;    double  sigma2 = 1.0;    double  nugget = 1.0e-1;    double sizeA=0.0;    FILE *f4;//      matform_t  mat_form   = unsymmetric;//    datename="/home/litvina/hlibpro-2.6/examples/c/Rmesh/coord.txt"; //    f4 = fopen( datename, "r");//    if( f4 == NULL)//    {//      printf( "Datei konnte nicht geoeffnet werden\n");//      exit (1);//    }        auto                        acc = fixed_prec( 1e-5);        TCovCoeffFn                 coefffn( length,                                             nu,                                             sigma2,                                             nugget,                                             vertices,                                             ct->perm_i2e(), ct->perm_i2e() );        TACAPlus< real_t >          aca( & coefffn );        TDenseMatBuilder< real_t >  h_builder( & coefffn, & aca );        //        // build H-matrix        //                cout << "  building H-matrix" << endl;                auto  tic = now();                auto  A = h_builder.build( bct.get(), acc, progress.get() );        //DBG::write(A.get(), "A.mat", "A");                auto  toc = since( tic );       // mvis_struct.print( A.get(), "A_struct" );       // mvis_mem.print( A.get(), "A_mem" );         sizeA =  A->byte_size();       // cout << "    size of H-matr ix = " << mem_per_dof( A ) << endl;       // cout << "    |A|₂             = " << format( "%.6e" ) % norm_2( A.get() ) << endl;       // cout << "    |A|_F            = " << format( "%.6e" ) % norm_F( A.get() ) << endl;        auto  options = fac_options_t( progress.get() );        //! Extreme important!!!        options.eval = point_wise;       // options.storage = general_diag;        //options.eval = block_wise;        tic = now();          //ll( A.get(), acc, options );       // HLIB::CFG::print_parameters();        TTruncAcc acc2(1e-7);        ll( A.get(), acc2, options );        A->set_unsymmetric();  ///Very IMPORTANT  !!!! Otherwise spectral norm is wrong                               // DBG::write(A.get(), "L.mat", "L");        //mvis_struct.print( A.get(), "L_struct" );       // mvis_mem.print( A.get(), "L_mem" );        // cout << "    |L|_2            = " << format( "%.6e" ) % norm_2( A.get() ) << endl;      //  cout << "    |L|_F            = " << format( "%.6e" ) % norm_F( A.get() ) << endl;       // mvis_struct.print( A.get(), "A_struct" );       // mvis_mem.print( A.get(), "A_mem" );        //std::vector< double * > vectorU( N );        auto  vectorU = A->col_vector();        for ( int  k = 0; k < N; k++ )           vectorU->set_entry( k, rhs.entry(k));        // 11May vectorU->set_entry( k, gaussrand_Stegun());       // DBG::write(vectorU.get(), "U.mat", "u");       // printf("norm before %5.5g \n",  vectorU->norm2() );        //            vectorU[k]=gaussrand_Stegun();        eval_lower  (  A.get(), vectorU.get(), apply_normal,  eval_option_t(point_wise, general_diag));                      // printf("norm after %5.5g \n",  vectorU->norm2() );        ct->perm_i2e()->permute( vectorU.get() );        //DBG::write(vectorU.get(), "Uafter.mat", "uafter");        //auto            dotp = re( vectorU.dot( vectorU.get() ) );        //std::cout << "    (Lx,Lx) = " << format( "%.8e" ) % dotp << std::endl;                f4 = fopen( "/home/litvina/111gsl/data_ying/Synthetic/111synthetic_512K.txt", "a+");        fprintf(f4, "%d \n", N);         for ( int k = 0; k < N; k++ )        {          fprintf(f4, "%7.7e\n", vertices[k][0]);        }        for (int k = 0; k < N; k++ ) // USE INPUT FILES with 'short'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!        {          fprintf(f4, "%7.7e\n", vertices[k][1]);        }                       for (int k= 0; k < N; k++ ) // USE INPUT FILES with 'short'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!        {          fprintf(f4, "%7.7e\n", vectorU->entry(k));        }        fclose(f4);         //write_vector( vectorU.get(), "/home/litvina/111gsl/data_ying/Synthetic/mydata_cpp.mat" );                                               DONE();        return 0;}