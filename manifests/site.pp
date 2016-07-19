node default { 
          include test
}
node puppet inherits default {}
node agent1 inherits default {}
