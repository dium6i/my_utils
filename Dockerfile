FROM python:3.12.11-slim

RUN apt update && apt install -y --no-install-recommends \
        wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://raw.githubusercontent.com/dium6i/my_utils/refs/heads/main/linux_gnu_libs.tar.gz \
    && tar -zxf linux_gnu_libs.tar.gz -C /usr/lib/x86_64-linux-gnu \
    && ldconfig \
    && pip install --no-cache-dir \
        opencv-python \
        onnxruntime \
        requests \
        fastapi \
        uvicorn \
        loguru \
        boto3 \
        PyYAML \
        pycryptodome \
        pillow \
        pyclipper \
        shapely \
        tqdm \
        python-multipart \
        pyzbar \
    && tar -zcf /usr/local/lib/python3.12/sp.tar.gz -C /usr/local/lib/python3.12 site-packages \
    && rm -rf /usr/local/lib/python3.12/site-packages \
    && rm -f linux_gnu_libs.tar.gz

ENTRYPOINT ["sh", "-c", "echo 'Decompressing image data...' && \
  tar -zxf /usr/local/lib/python3.12/sp.tar.gz -C /usr/local/lib/python3.12 && \
  rm -rf /usr/local/lib/python3.12/sp.tar.gz && \
  echo 'Data decompression completed!' && \
  exec bash"]