
module.exports={
    networks:{
        development:{
            host:"172.16.17.180",
            port:7545,
            network_id:"*",
        }
    },
    contracts_directory:"./contracts",
    compilers:{
        solc:{
            version:"0.8.0",
            optimizer:{
                enabled: true,
                runs:200
            }
        }
    },
    db:{
        enabled: false
    }

}