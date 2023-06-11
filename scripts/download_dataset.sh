DS=ycbv
SRC=https://bop.felk.cvut.cz/media/data/bop_datasets
cd datasets/BOP_DATASETS
wget $SRC/${DS}_base.zip         # Base archive with dataset info, camera parameters, etc.
wget $SRC/${DS}_models.zip       # 3D object models.
wget $SRC/${DS}_test_all.zip     # All test images ("_bop19" for a subset used in the BOP Challenge 2019/2020).
wget $SRC/${DS}_train_pbr.zip    # PBR training images (rendered with BlenderProc4BOP).
wget $SRC/${DS}_train_real.zip    # PBR training images (rendered with BlenderProc4BOP).


unzip ${DS}_base.zip             # Contains folder "lm".
unzip ${DS}_models.zip -d ${DS}     # Unpacks to "lm".
unzip ${DS}_test_all.zip -d ${DS}   # Unpacks to "lm".
unzip ${DS}_train_pbr.zip -d ${DS}  # Unpacks to "lm".


#rm ${DS}_base.zip 
#rm ${DS}_models.zip
#rm ${DS}_test_all.zip  