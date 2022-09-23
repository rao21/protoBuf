#! env python3
#protoc --dart_out=grpc:lib/src/generated -Iprotos protos/*.proto
# import os, subprocess, glob

# proj_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

# subprocess.run(
#     'protoc --dart_out=grpc:lib/src/generated -Iprotos protos/*.proto',
#     shell=True, cwd=proj_dir
# )

