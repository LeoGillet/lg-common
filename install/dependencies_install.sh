#!/bin/bash
cd /tmp/dep-installers/downloads

# Install bowtie2
echo "Downloading bowtie2..."
wget -O bowtie2.zip https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.5.2/bowtie2-2.5.2-source.zip/download
unzip bowtie2.zip
cd bowtie2-2.5.2; make

# Install BWA
echo "Downloading BWA..."
git clone https://github.com/lh3/bwa.git /opt/bwa
echo "Installing BWA..."
cd /opt/bwa; make
ln -s /opt/bwa/bwa /usr/bin/bwa

# Downloading samtools and bcftools
echo "Downloading samtools and bcftools..."
cd /tmp/dep-installers/downloads
wget -O samtools.tar.bz2 https://github.com/samtools/samtools/releases/download/1.18/samtools-1.18.tar.bz2
wget -O bcftools.tar.bz2 https://github.com/samtools/bcftools/releases/download/1.18/bcftools-1.18.tar.bz2

# Extracting samtools and bcftools
echo "Extracting samtools and bcftools..."
tar -xf samtools.tar.bz2
tar -xf bcftools.tar.bz2

# Compiling samtools
echo "Compiling samtools..."
cd /tmp/dep-installers/downloads/samtools-1.18
./configure --prefix=/opt/samtools
make
make install
ln -s /opt/samtools/bin/samtools /usr/bin/samtools

# Compiling bcftools
echo "Compiling bcftools..."
cd /tmp/dep-installers/downloads/bcftools-1.18; ./configure --prefix=/opt/bcftools; make; make install
ln -s /opt/bcftools/bin/bcftools /usr/bin/bcftools
ln -s /opt/bcftools/bin/vcfutils.pl /usr/bin/vcfutils.pl

# Install seqtk
echo "Downloading seqtk..."
git clone https://github.com/lh3/seqtk.git /opt/seqtk;
echo "Installing seqtk..."
cd /opt/seqtk; make
ln -s /opt/seqtk/seqtk /usr/bin/seqtk

# Install bedtools
echo "Downloading bedtools..."
cd /tmp/dep-installers/downloads
wget -O bedtools.tar.gz https://github.com/arq5x/bedtools2/releases/download/v2.31.1/bedtools-2.31.1.tar.gz
tar xf bedtools.tar.gz
mv bedtools2 /opt/; cd /opt/bedtools2; make
ln -s /opt/bedtools2/bin/bedtools /usr/bin/bedtools 

# Install fastp
echo "Downloading fastp..."
mkdir /opt/fastp; cd /opt/fastp
wget http://opengene.org/fastp/fastp
chmod a+x ./fastp
ln -s /opt/fastp/fastp /usr/bin/fastp

# Install FastQC
echo "Downloading FastQC..."
cd /tmp/dep-installers/downloads
wget -O fastqc.zip https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip
cd /opt; unzip /tmp/dep-installers/downloads/fastqc.zip
ln -s /opt/FastQC/fastqc /usr/bin/fastqc

# Install MUSCLE
echo "Downloading MUSCLE..."
git clone https://github.com/rcedgar/muscle.git /opt/muscle
echo "Compiling MUSCLE..."
cd /opt/muscle/src; make
ln -s /opt/muscle/src/Linux/muscle /usr/bin/muscle

cd /; rm -rf /tmp/dep-installers