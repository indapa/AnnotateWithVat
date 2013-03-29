wget http://pysam.googlecode.com/files/pysam-0.7.tar.gz

gunzip pysam-0.7.tar.gz
tar -xvf pysam-0.7.tar

cd pysam-0.7
sudo python setup.py build
python setup.py install --user
cd ..
