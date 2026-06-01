#!/bin/bash
cd "$(dirname "$0")/.."
docker build -t team-02-demo .
docker run --rm -p 6080:6080 team-02-demo
