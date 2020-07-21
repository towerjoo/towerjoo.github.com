from random import sample, shuffle
import requests
from credential import UNSPLASH, PIXABAY
import argparse
from PIL import Image
from io import BytesIO
import os
from datetime import datetime

ROOT = os.path.abspath(os.path.dirname(__file__))


class PictureSource:
    UNSPLASH = 1
    PIXABAY = 2


class Picture(object):
    def __init__(self):
        pass


class Unsplash(Picture):
    def __init__(self):
        self.access_key = UNSPLASH['API_KEY']

        self.access_secret = UNSPLASH['API_SECRET']
        self.base_url = "https://api.unsplash.com"
        self.exclude_authors = ["mischievous_penguins"]

    def get(self, path, params=None):
        headers = {
            "Authorization": f"Client-ID {self.access_key}",
            "Accept-Version": "v1",
        }
        params = {} if params is None else params
        endpoint = f"{self.base_url}{path}"
        resp = requests.get(endpoint, params=params, headers=headers)
        return resp.json()

    def get_pictures(self, query, count, page=1):
        # https://unsplash.com/documentation#search-photos
        path = "/search/photos"
        params = {
            "page": page,
            "per_page": count,
            "query": query,
            "orientation": "landscape",
        }
        pictures = self.get(path, params).get("results", [])

        pictures = [
            {
                "display_url": p["urls"]["small"],
                # use the regular because the raw download is too large
                "download_url": p["urls"]["regular"],
                "thumbnail_url": p["urls"]["thumb"],
            } for p in pictures
        ]
        return pictures


class Pixabay(Picture):
    def __init__(self):
        self.key = PIXABAY['API_KEY']
        self.base_url = "https://pixabay.com/api/"

    def get(self, params=None):
        params = {} if params is None else params
        params.update({"key": self.key})
        endpoint = self.base_url
        resp = requests.get(endpoint, params=params)
        # breakpoint()
        return resp.json()

    def get_pictures(self, query, count, page=1):
        # https://pixabay.com/api/docs/#api_rate_limit
        params = {
            "q": query,
            # Accepted values: "all", "horizontal", "vertical" Default: "all"
            "orientation": "horizontal",
            "page": page,
            "per_page": count,
        }
        data = self.get(params)
        pictures = data.get("hits", [])
        pictures = [
            {
                "display_url": p["webformatURL"],  # previewURL
                "download_url": p["largeImageURL"],
                "thumbnail_url": p["previewURL"],
            } for p in pictures
        ]
        return pictures


def get_pictures(query, source=PictureSource.UNSPLASH, page=1):
    if source == PictureSource.UNSPLASH:
        photos_src = Unsplash()
    else:
        photos_src = Pixabay()
    query = "+".join([q.strip() for q in query.split(",")])
    pics = photos_src.get_pictures(query, 10, page)
    shuffle(pics)
    return pics


def download_and_process(url, keyword, overwrite=False):
    """download the image and resize
    and save to the correct directory
    """
    width = 1024  # the width of the image
    image = requests.get(url).content
    im = Image.open(BytesIO(image))
    orig_width, orig_height = im.size
    height = width * (orig_height / orig_width)
    new_size = (width, int(height))
    im.thumbnail(new_size)
    orig_filename = keyword.replace(' ', '-')
    filename = orig_filename
    suffix = 1
    while True:
        path = os.path.join(ROOT, "assets/images", filename + '.png')
        if not os.path.exists(path) or overwrite:
            break
        filename = orig_filename + '-' + str(suffix)
        suffix += 1
    im.save(path)
    print(f"the image has been saved to {path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Search and download picture')

    parser.add_argument('--keyword',
                        dest='keyword',
                        type=str,
                        help='search term')
    parser.add_argument('--overwrite',
                        dest='overwrite',
                        action="store_true",
                        default=False,
                        help='whether to overwrite the image if exists')

    args = parser.parse_args()
    keyword = args.keyword
    overwrite = args.overwrite
    if keyword is None:
        print("keyword is required")
        parser.print_help()
    else:
        print(f'trying to search and download for keyword: {keyword}')
        pictures = get_pictures(keyword, source=PictureSource.PIXABAY)
        pic = pictures[0]
        url = pic['download_url']
        download_and_process(url, keyword, overwrite)