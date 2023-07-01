SOURCE="/home/bvdc1/thanhtt/repos/Kaggle/hubmap_hv/yolov8_hubmap_hhv/ultralytics"
IMAGES="/media/bvdc1/data1/thanhtt_data/Kaggle/competitions/hubmap_hv"
OUTPUT="/media/bvdc1/data1/thanhtt_data/Kaggle/competitions/hubmap_hv/repos/yolov8_training"
DOCKER_IMAGE="hubmap_hhv_yolov8:0.1"

# dataset_dir = /usr/src/hubmap_hv/repos/yolov8_yaml_v0.0.1/dataset.yaml
# update code manuall: cp -r /usr/src/yolov8/ultralytics ./ultralytics
# test image: /usr/src/hubmap_hv/hubmap-hacking-the-human-vasculature/test/72e40acccadf.tif
# eval:         yolo segment val data=/usr/src/hubmap_hv/repos/yolov8_yaml_v0.0.1/dataset.yaml model=runs/segment/train/weights/best.pt conf=0.25 iou=0.7
# train:        yolo segment train model=yolov8n-seg.pt data=/usr/src/hubmap_hv/repos/yolov8_yaml_v0.0.1/dataset.yaml epochs=50 imgsz=1024 project=runs/hubmap_hhv name=v8n_3cls_dataset1_imgz1024 exist_ok=True batch=16 workers=4

sudo docker run --gpus all -it \
    --shm-size=8gb --env="DISPLAY" --net=host \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --mount type=bind,source=$SOURCE,target=/usr/src/ultralytics/ultralytics \
    --mount type=bind,source=$IMAGES,target=/usr/src/hubmap_hv \
    --mount type=bind,source=$OUTPUT,target=/usr/src/ultralytics/runs \
    --volume=$HOME/.torch/fvcore_cache:/tmp:rw \
    --name=hubmap_hhv_yolov8_0.1 $DOCKER_IMAGE