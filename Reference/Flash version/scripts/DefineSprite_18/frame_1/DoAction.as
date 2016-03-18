trace(_root.getBytesLoaded());
trace(_root.getBytesTotal());
this.bar._xscale = Math.floor(_root.getBytesLoaded() * 100 / _root.getBytesTotal());
