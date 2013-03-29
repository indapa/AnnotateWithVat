wget http://pysam.googlecode.com/files/pysam-0.7.tar.gz

gunzip pysam-0.7.tar.gz
tar -xvf pysam-0.7.tar

cd pysam-0.7
python setup.py build
python setup.py install --user
export PYTHONPATH=/home/$USER/.local/lib/python2.7/site-packages
cd ..

