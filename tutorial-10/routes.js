module.exports = app => {

    const controller = require("./controller.js");  
    var router = require("express").Router();  


    
    router.post("/", controller.create);
  

    router.get("/", controller.findAll);
  

    router.delete("/:id", controller.delete)


    router.get("/:id", controller.findOne)

    router.get("/name/:name", controller.findOne)

    app.use('/api/', router);

  };