node default { 
          include test
}
node puppet inherits default {}
node server1 inherits default {}
