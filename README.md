Here's the updated README file for the Bitcoin Node Docker Container:

# Bitcoin Node Docker Container

This Docker container runs a Bitcoin node, allowing you to participate in the Bitcoin network.

## Building the Container

To build the container, run the following command in the directory containing the Dockerfile:

docker build -t bitcoin-node .

## Running the Container

To run the container, use the following command:

docker run -d -p 18333:18333 -p 18332:18332 --restart always -v bitcoin-data:/bitcoin --name bitcoin-node bitcoin-node

This command does the following:

    -d: Runs the container in detached mode (in the background).
    -p: Exposes the necessary ports for the Bitcoin node (8333 for P2P, 8332 for RPC).
    --restart always: Automatically restarts the container if it stops or the Docker daemon restarts.
    -v: Mounts a volume named bitcoin-data to the /bitcoin directory in the container to persist the Bitcoin data.
    --name: Assigns a name to the container for easy reference.
    bitcoin-node: Specifies the name of the Docker image to use.

The container will start the Bitcoin node and begin syncing with the network. You can access the node's JSON-RPC interface using the exposed RPC port.

## Stopping the Container

To stop the container, run:

docker stop bitcoin-node

This will gracefully stop the Bitcoin node and the container.

## Accessing the Bitcoin CLI

To access the bitcoin-cli command inside the container, you can use the following command:

docker exec -it bitcoin-node bitcoin-cli <command>

Replace <command> with the desired bitcoin-cli command and arguments.

For example, to get the current block count:

docker exec -it bitcoin-node bitcoin-cli getblockcount
