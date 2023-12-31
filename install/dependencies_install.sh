#!/bin/bash
cd /tmp/dep-installers/downloads

# Install BBMap
echo "Downloading BBMap..."
wget -O bbmap.tar.gz https://sourceforge.net/projects/bbmap/files/BBMap_39.04.tar.gz/download
tar xf bbmap.tar.gz
mv bbmap /opt/
ln -s /opt/bbmap/clumpify.sh /usr/bin/clumpify.sh
ln -s /opt/bbmap/bbmap.sh /usr/bin/bbmap.sh

# Install k-SLAM
git clone https://github.com/LeoGillet/k-SLAM.git /opt/k-SLAM
cd /opt/k-SLAM/build; make; cd ..; mv build/SLAM ./
ln -s /opt/k-SLAM/SLAM /usr/bin/SLAM

# Install bowtie2
echo "Downloading bowtie2..."
wget -O bowtie2.zip https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.5.2/bowtie2-2.5.2-source.zip/download
unzip bowtie2.zip
mv bowtie2-2.5.2 /opt/bowtie2; cd /opt/bowtie2; make
ln -s /opt/bowtie2/bowtie2 /usr/bin/bowtie2
ln -s /opt/bowtie2/bowtie2-build /usr/bin/bowtie2-build

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
wget -O htslib.tar.bz2 https://github.com/samtools/htslib/releases/download/1.18/htslib-1.18.tar.bz2

# Extracting samtools and bcftools
echo "Extracting samtools and bcftools..."
tar -xf samtools.tar.bz2
tar -xf bcftools.tar.bz2
tar -xf htslib.tar.bz2

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

# Compiling htslib
echo "Compiling htslib..."
cd /tmp/dep-installers/downloads/htslib-1.18; ./configure --prefix=/opt/htslib; make; make install
ln -s /opt/htslib/bin/tabix /usr/bin/tabix

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
ln -s /opt/bedtools2/bin/fastaFromBed /usr/bin/fastaFromBed

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

# Install SeqKit
wget -O seqkit.tar.gz https://github.com/shenwei356/seqkit/releases/download/v2.6.1/seqkit_linux_amd64.tar.gz
tar xf seqkit.tar.gz
mv seqkit /usr/bin/seqkit
