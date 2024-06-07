# HINTED: Hard Instance Enhanced Detector with Mixed-Density Feature Fusion for Sparsely-Supervised 3D Object Detection (Coming soon......)

This is a official code release of HINTED (Hard Instance Enhanced Detector with Mixed-Density Feature Fusion for Sparsely-Supervised 3D Object Detection). This code is mainly based on OpenPCDet.

## Detection Framework

![image](https://github.com/xmuqimingxia/HINTED/assets/108978798/eec6ab09-63f4-4a2d-8a97-afa04d71b9f8)

## Getting Started
### Installation
a. Clone this repository.
```shell
git clone https://github.com/xmuqimingxia/HINTED.git
```
b. Create virtual-env.
```shell
conda create -n HINTED python=3.8
```
b.1 cuda-11.4、cuda-11.6、cuda-11.7 tested
```
conda activate HINTED
pip install torch==1.13.0+cu116 torchvision==0.14.0+cu116 torchaudio==0.13.0 --extra-index-url https://download.pytorch.org/whl/cu116
pip install spconv-cu116	
pip install -r requirements.txt
python setup.py develop
```
b.2 cuda-12.x not tested
```
conda activate HINTED
pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu121
pip install spconv-cu120
pip install -r requirements.txt
python setup.py develop
```

### Prepare dataset and pre-training model
pre_train model:
[CoIn(VoxelRCNN-based)](https://drive.google.com/file/d/1hc6JUBYaNDGN_3CdHnl05mzzCgzX1Ul3/view?usp=sharing)

train_info:
[Sparsely-supervised train info](https://drive.google.com/file/d/1-5dWDii-I3MZNFAMYnQ_pHNZgAB6mNsL/view?usp=sharing)

label_idx:
[label_idx.txt](https://drive.google.com/file/d/16VXLD0pLO-9NGEd273woXN1_udUwUOyX/view?usp=sharing)

* Please download the official [KITTI 3D object detection](http://www.cvlibs.net/datasets/kitti/eval_object.php?obj_benchmark=3d) dataset and organize the downloaded files as follows (the road planes could be downloaded from [[road plane]](https://drive.google.com/file/d/1d5mq0RXRnvHPVeKx6Q612z0YRO1t2wAp/view?usp=sharing), which are optional for data augmentation in the training):
```
HINTED
├── data
│   ├── kitti
│   │   │── ImageSets
│   │   │── training
│   │   │   ├──calib & velodyne & label_2 & image_2 & (optional: planes) & (optional: depth_2)
│   │   │── testing
│   │   │   ├──calib & velodyne & image_2
|   |   |── kitti_infos_train_coin.pkl
├── pcdet
├── tools
```
Generate the data infos by runing the following command:
```
bash remove.sh
```
## Training
```
cd ../../tools
```
*if you use singe gpu run
```
python train.py --cfg_file cfgs/kitti_models/voxel_rcnn_3classes_ssl_centerHead.yaml --pretrained_model <path_to_pretrained_model_CoIn(VoxelRCNN-based)> --labeled_frame_idx <path_to_label_idx.txt>
```
*if you use multi 8 gpus run
```
bash scripts/dist_train.sh 8 --cfg_file cfgs/kitti_models/voxel_rcnn_3classes_ssl_centerHead.yaml --pretrained_model <path_to_pretrained_model_CoIn(VoxelRCNN-based)> --labeled_frame_idx <path_to_label_idx.txt>
```

### Acknowledgement
This code is based on [OpenPCDet](https://github.com/open-mmlab/OpenPCDet),[3DIoUMatch](https://github.com/THU17cyz/3DIoUMatch-PVRCNN),[HSSDA](https://github.com/azhuantou/HSSDA) and [COIN](https://github.com/xmuqimingxia/CoIn) .

If you find some help for you, star is a good reward ^_^.
