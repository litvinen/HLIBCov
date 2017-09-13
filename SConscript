#
# SCons build script for HLIBpro; examples subdirectory
#

from  os       import remove
from  os.path  import join
from  glob     import glob

#
# get environment
#

Import( 'example_cenv' )
Import( 'example_cxxenv' )

cenv   = example_cenv.Clone()
cxxenv = example_cxxenv.Clone()

#
# local settings
# 

cenv.Append(    CPPPATH = [ '#include' ] )
cxxenv.Append(  CPPPATH = [ '#include' ] )

cenv.Prepend(   LIBPATH = [ '#lib' ] )
cenv.Prepend(   LIBS    = [ 'hpro' ] )
cxxenv.Prepend( LIBPATH = [ '#lib' ] )
cxxenv.Prepend( LIBS    = [ 'hpro' ] )

#
# additional actions
#

if cenv.GetOption( 'clean' ):
    # remove backup files
    files = glob( '*~' )
    for file in files:
        remove( file )
    
#
# program definition
#

examples = []


#examples.append( cenv.Program( join( 'c', 'bem1d.c'     ) ) )
#examples.append( cenv.SharedLibrary( join( 'c', 'bem1d.c'     ) ) )
examples.append( cenv.Program( join( 'c', 'cbem1d.c'     ) ) )
examples.append( cenv.Program( join( 'c', 'laplace.c'   ) ) )
examples.append( cenv.Program( join( 'c', 'bsp_part.c'  ) ) )
examples.append( cenv.Program( join( 'c', 'sparsealg.c' ) ) )
examples.append( cenv.Program( join( 'c', 'sparsebsp.c' ) ) )
examples.append( cenv.Program( join( 'c', 'loglikelihood.c') ))
#examples.append( cenv.SharedLibrary( join( 'c', 'loglikelihood.c') ))
#examples.append( cenv.SharedLibrary( join( 'c', 'libs_loglikelihood.c') ))
#examples.append( cenv.Program( join( 'c', 'mylib.c') ))

#examples.append( cxxenv.Program( 'bem1d.cc' ) )
#examples.append( cxxenv.Program( 'sparsealg.cc' ) )
#examples.append( cxxenv.Program( 'sparsebsp.cc' ) )
#examples.append( cxxenv.Program( 'laplace.cc' ) )
#examples.append( cxxenv.Program( 'helmholtz.cc' ) )
#examples.append( cxxenv.Program( 'acoustic.cc' ) )
#examples.append( cxxenv.Program( 'manyrhs.cc' ) )
examples.append( cxxenv.Program( 'loglikelihood.cc' ) )
#examples.append( cxxenv.Program( 'spectrum.cc' ) )
#examples.append( cxxenv.Program( 'factorize.cc' ) )

#
# set default targets
#

Alias( 'examples', examples )
Default( 'examples' )
