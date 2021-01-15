#!/bin/sh

fly -t tutorial builds
fly -t tutorial set-pipeline -c /home/centos/concourse-tutorial/tutorials/basic/basic-pipeline/pipeline_next.yml -p job-next-pipeline
fly -t tutorial builds -j job-next-pipeline/job-next-pipeline
sleep 30
fly -t tutorial set-pipeline -c /home/centos/concourse-tutorial/tutorials/basic/basic-pipeline/pipeline.yml -p job-hello-world
fly -t tutorial builds -j hello-world/job-hello-world
sleep 10
fly -t tutorial builds

