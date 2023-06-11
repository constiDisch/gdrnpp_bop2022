from pathlib import Path
import json
import numpy as np


base_path = Path("datasets/BOP_DATASETS/ycbv/train_real")
n_imgages = 200

all_images = []
for scene_gt in base_path.glob("**/scene_gt_info.json"):
    with open(scene_gt, "r") as fio:
        image_ids = list(json.load(fio).keys())
    image_ids_selected = np.random.choice(image_ids, n_imgages, replace=False)
    all_images.extend([f"{scene_gt.parts[-2]}/{int(id):06}"for id in image_ids_selected])

all_images.sort()
with open("train.txt", "w") as fio:
    fio.write("\n".join(all_images))