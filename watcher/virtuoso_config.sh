#!/bin/bash

# Configuration
CONTAINER="my-virtuoso"
# CONTAINER="virtuoso"
PORT="1111"
USER="dba"
PASS="dba"
RDF_DIR="/rdf"
GRAPH_BASE="http://example.org/"

echo "Loading RDF files from $RDF_DIR into Virtuoso..."

docker exec -i $CONTAINER /opt/virtuoso-opensource/bin/isql $PORT $USER $PASS << EOF
ld_dir('$RDF_DIR', '*.ttl', '$GRAPH_BASE');
rdf_loader_run();
checkpoint;
status();
EXIT;
EOF

echo "RDF loading complete!"
