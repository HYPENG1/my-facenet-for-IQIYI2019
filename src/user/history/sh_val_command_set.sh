# add facenet source to python path
export PYTHONPATH=/home/hyp/facenet/src:$PYTHONPATH;
# extract face img in videos
python src/align/align_dataset_mtcnn.py \
/cdisk/wenfahu/20190408/IQIYIdataset/val_frame_1 \
./datasets/IQIYIdataset0/val_frame_1 \
--image_size 160 \
--margin 32 \
--random_order \
--gpu_memory_fraction 1 \
--threshold_P 0.7 \
--threshold_R 0.8 \
--threshold_O 0.8 \
--gpu_device 2,3;
python src/align/align_dataset_mtcnn.py \
/cdisk/wenfahu/20190408/IQIYIdataset/val_frame_2 \
./datasets/IQIYIdataset0/val_frame_2 \
--image_size 160 \
--margin 32 \
--random_order \
--gpu_memory_fraction 1 \
--threshold_P 0.7 \
--threshold_R 0.8 \
--threshold_O 0.8 \
--gpu_device 2,3;
python src/align/align_dataset_mtcnn.py \
/cdisk/wenfahu/20190408/IQIYIdataset/val_frame_3 \
./datasets/IQIYIdataset0/val_frame_3 \
--image_size 160 \
--margin 32 \
--random_order \
--gpu_memory_fraction 1 \
--threshold_P 0.7 \
--threshold_R 0.8 \
--threshold_O 0.8 \
--gpu_device 2,3;
python src/align/align_dataset_mtcnn.py \
/cdisk/wenfahu/20190408/IQIYIdataset/val_frame_4 \
./datasets/IQIYIdataset0/val_frame_4 \
--image_size 160 \
--margin 32 \
--random_order \
--gpu_memory_fraction 1 \
--threshold_P 0.7 \
--threshold_R 0.8 \
--threshold_O 0.8 \
--gpu_device 2,3;
# extract face features per video
# val feat extract
python src/user/face_feature_extract.py \
./datasets/IQIYIdataset0 \
./models/facenet/20190523-104720 \
--use_fixed_image_standardization \
--face_feat_dir ./generate_files/my_val_face_per_video.pickle \
--val_mode \
--gpu_device 0,1;
# calculation feat per label
python src/user/final_validation.py \
--face_feat_dir ./generate_files/my_val_face_per_video.pickle \
--feature_face_per_label_dir ./generate_files/train_feature_face.pickle \
--subtract_mean