rm -rf ../data/kitti/gt_database ../data/kitti/kitti_infos_train.pkl  ../data/kitti/kitti_dbinfos_train.pkl
cp ../data/kitti/kitti_infos_train_coin.pkl ../data/kitti/kitti_infos_train.pkl 
python -m pcdet.datasets.kitti.kitti_dataset create_kitti_infos cfgs/dataset_configs/kitti_dataset.yaml