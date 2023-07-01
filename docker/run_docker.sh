SOURCE="/home/bvdc1/thanhtt/repos/Kaggle/yolov8_hubmap_hhv/ultralytics/ultralytics"
IMAGES="/media/bvdc1/data1/thanhtt_data/Kaggle/competitions/hubmap_hv"
OUTPUT="/media/bvdc1/data1/thanhtt_data/Kaggle/competitions/hubmap_hv/repos/yolov8_training"
DOCKER_IMAGE="hubmap_hhv_yolov8:0.1"

# dataset_dir = /usr/src/hubmap_hv/repos/yolov8_yaml_v0.0.1/dataset.yaml
# update code manuall: cp -r /usr/src/yolov8/ultralytics ./ultralytics
# test image: /usr/src/hubmap_hv/hubmap-hacking-the-human-vasculature/test/72e40acccadf.tif

sudo docker run --gpus all -it \
    --shm-size=8gb --env="DISPLAY" --net=host \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --mount type=bind,source=$SOURCE,target=/usr/src/ultralytics/ultralytics \
    --mount type=bind,source=$IMAGES,target=/usr/src/hubmap_hv \
    --mount type=bind,source=$OUTPUT,target=/usr/src/ultralytics/runs \
    --volume=$HOME/.torch/fvcore_cache:/tmp:rw \
    --name=hubmap_hhv_yolov8_0.1 $DOCKER_IMAGE