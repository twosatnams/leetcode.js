// Given a node/tree, return all of the paths that originate from that node

function allPaths(node) {
  var paths = [];
  if (node.left === null && node.right === null) {
    paths.push([node.value]);
  } else {
    if (node.left === null) {
      paths.push([node.value]);
    } else {
      var leftPaths = allPaths(node.left);
      for (var i = 0; i < leftPaths.length; i++) {
        paths.push([node.value].concat(leftPaths[i]));
      }
    }

    if (node.right === null) {
      paths.push([node.value]);
    } else {
      var rightPaths = allPaths(node.right);
      for (var i = 0; i < rightPaths.length; i++) {
        paths.push([node.value].concat(rightPaths[i]));
      }
    }
  }

  return paths;
}
