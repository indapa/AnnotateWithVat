GSL=ftp://ftp.gnu.org/gnu/gsl/gsl-1.15.tar.gz
GSLFILE=gsl-1.15.tar.gz

BLATSUITE=http://hgwdev.cse.ucsc.edu/~kent/exe/linux/blatSuite.34.zip
BLATFILE=blatSuite.34.zip

BIOS=http://homes.gersteinlab.org/people/lh372/VAT/libbios-1.0.0.tar.gz
BIOSFILE=libbios-1.0.0.tar.gz

TABIX=http://sourceforge.net/projects/samtools/files/tabix/tabix-0.2.6.tar.bz2
TABIXFILE=tabix-0.2.6.tar.bz2

VAT=https://s3.amazonaws.com/vat-releases/vat-2.0.1.tar.gz
VATFILE=vat-2.0.1.tar.gz

#get gsl
if  [ ! -f $GSLFILE ]
then
wget $GSL
fi

if [ ! -f gsl-1.15.tar ]
then
gunzip $GSLFILE
fi

if [ ! -d gsl-1.15 ]
then
tar -xvf gsl-1.15.tar
fi

cd gsl-1.15
sudo ./configure
sudo make
sudo make install
cd ../

#get Bios library
if [ ! -f $BIOSFILE ]
then
wget $BIOS
fi

if [ !  -f libbios-1.0.0.tar ]
then
gunzip $BIOSFILE
fi

if   [ ! -d libbios-1.0.0 ]
then
tar -xvf libbios-1.0.0.tar  
fi
#now build the Bios library
cd libbios-1.0.0
sudo ./configure
sudo make
sudo make install
cd ../


#get blatsuite
if [ ! -f $BLATFILE ]
then
wget $BLATSUITE
fi
if [ ! -d blatSuite ]
then
mkdir blatSuite
fi
mv $BLATFILE blatSuite
cd blatSuite
unzip $BLATFILE
cd ../

#get tabix
if [ ! -f $TABIXFILE ]
then
wget $TABIX
fi
bunzip2 $TABIXFILE
tar -xvf tabix-0.2.6.tar  
cd tabix-0.2.6
make
cd ..

#get VAT
if [ ! -f $VATFILE  ]
then
wget $VAT
fi
gunzip $VATFILE
tar -xvf vat-2.0.1.tar
cd vat-2.0.1
sudo ./configure
sudo make
sudo make install

cd ../
#so we can run the executable, we need to set an environment variable to point where the bios lib lives
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH
