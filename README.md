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

## Configuration

By default, the container runs the Bitcoin node on the mainnet. If you want to run it on the testnet, you can set the environment variable TESTNET to 1 when running the container:

docker run -d -p 8333:8333 -p 8332:8332 --restart always -v bitcoin-data:/bitcoin -e TESTNET=1 --name bitcoin-node bitcoin-node

The container uses a default configuration file located at /bitcoin/bitcoin.conf inside the container. You can modify this file by mounting a custom configuration file or by setting environment variables when running the container.

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

That's it! You now have a README file for your Bitcoin Node Docker Container. Feel free to customize it further based on your specific requirements and any additional information you want to provide.