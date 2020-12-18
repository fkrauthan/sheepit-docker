Sheep-It Agent
==============

A optimized and secured [Sheep-It](https://www.sheepit-renderfarm.com/index.php) Render agent to add rendering power to the open Blender render cloud.


Instructions
------------

You need your sheep-it account username and password to proceed:

```
docker run -d \
  --name "sheepit-agent" \
  -e SHEEPIT_USERNAME=XXXXXX \
  -e SHEEPIT_PASSWORD=YYYYYY \
  fkrauthan/sheepit:latest
```

To limit CPU you can use the native Docker resource limitations.  For instance, to limit Sheepit to 50% of a 8-core CPU, use `--cpus=4`

To limit memory, you can use the environment variable SHEEPIT_MEMORY_LIMIT. E.g. `-e SHEEPIT_MEMORY_LIMIT=4GB`

To use GPU as a compute method set SHEEPIT_COMPUTE_METHOD. E.g. `-e set SHEEPIT_COMPUTE_METHOD=GPU`

About this Image
----------------

This image is based on the openjdk slim template and adds the additional required libraries to run the agent and belender renderer.

**Images:**
* `latest` will always point to the latest image
* `xxx.yyy.zzz` reflects the current sheep-it render agent version


Additional Links
----------------

[Docker Hub page](https://hub.docker.com/r/fkrauthan/sheepit/)  
[GitHub page](https://github.com/fkrauthan/sheepit-docker)

[SheepIt client GitHub repo](https://github.com/laurent-clouet/sheepit-client)  
[SheepIt site](https://www.sheepit-renderfarm.com/)
