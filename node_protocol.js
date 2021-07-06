class Node {
    state = false

    fire = allNodes => {
        if (this.state) {
            return
        }

        this.state = true;

        let randomObject = this.#random(allNodes);
        randomObject.forEach(item => item.fire(allNodes))
    }

     #random = allNodes =>  {
        let randomObjects = [];
        while (randomObjects.length !== 3) {

            let random_number = Math.ceil(Math.random() * (allNodes.length - 1))

            if (allNodes[random_number] === this && randomObjects.includes(allNodes[random_number])) {
                continue
            }

            randomObjects.push(allNodes[random_number]);
        }
        return randomObjects;
    }
}

class NodeProtocol {
    constructor(nodes) {
        this.nodes = nodes;
    }

    call = () => this.#calculate();


   #createObjects = () => {
        let object = [];

        for (let i = 0; i < this.nodes; i++) {
            object[i] = new Node();
        }
        return object;
   }

   #send = () => {
        let connections = this.#createObjects();
        connections[0].fire(connections);
        return connections;
   }

   #calculate = () => {
        let connections = this.#send();
        let count = 0;

        connections.forEach(item => {
            if (!item.state) {
                return
            }
            count++
        })
       const percentage = count * 100 / this.nodes;

       return `% of received nodes = ${percentage}%`
   }

}

console.log(new NodeProtocol(1000).call());




