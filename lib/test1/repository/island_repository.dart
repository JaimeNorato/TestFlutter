import 'dart:math';

class IslandRepository {

  IslandRepository(this.size);

  final int size;

  late List<List<int>> _mapIslands;

  late List<Map> vertices = [];
  late List<List<Map>> islands = [];

  /// genera un mapa de islas de numeros aleatorios con el tamaño indicado
  List<List<int>> generateMap(){
    _mapIslands = List<List<int>>.generate(size, (i) => List<int>.generate(size, (j) => Random().nextInt(2)));
    // mapIslands = [
    //   [1,1,0,1,1],
    //   [1,1,0,0,0],
    //   [0,1,0,0,0],
    //   [0,1,0,0,1],
    //   [1,1,0,1,1],
    // ];
    vertices = [];
    islands = [];
    return _mapIslands;
  }
  /// actualiza el mapa de islas con el nuevo valor
  set mapIslands(List<List<int>> newMap){
    _mapIslands = newMap;
    vertices = [];
    islands = [];
  }
  /// realiza el conteo de islas
  Map<String, int> countIslands(){
    searchVertices();
    mapsIslands();
    validateVertices();
    return {"vertices": vertices.length, "islands": islands.length};
  }
  /// busca las vertices de las islas
  searchVertices(){
    for(int i = 0; i < size; i++){
      for(int j = 0; j < size; j++){
        if(_mapIslands[i][j] == 1 && isVertex(i, j)){
          vertices.add({'x': i, 'y': j});
        }
      }
    }
  }
  /// valida si en la posicion indicada es un vertice
  isVertex(int i, int j){
    // if((i == 0 || mapIslands[i - 1][j] == 0) && (j == 0 || mapIslands[i][j - 1] == 0) && (i == size - 1 || mapIslands[i + 1][j] == 0) && (j == size - 1 || mapIslands[i][j + 1] == 0)){
    return (i == 0 || _mapIslands[i - 1][j] == 0) && (j == 0 || _mapIslands[i][j - 1] == 0);
  }
  /// valida el listado de vertices, para saber si es una isla
  validateVertices(){
    for(int i = 0; i < vertices.length; i++){
      if(!isValidVertex(vertices[i]['x'], vertices[i]['y'])){
        vertices.removeAt(i);
      }
    }
  }
  /// valida si el vertice es valido y no es parte de otra isla
  bool isValidVertex(int x, int y) {
    return !( x < size-2 && isInIslands(x+1, y) || (y < size-2 && isInIslands(x, y+1)) );
  }
  /// realiza la validacion de los vertices y mapea las islas
  mapsIslands(){
    for(int i = 0; i < vertices.length; i++){
      List<Map> island = [];
      if((vertices[i]['x'] == 0 && vertices[i]['y'] == 0) || isValidVertex(vertices[i]['x'],vertices[i]['y'])){
        island.add({'x': vertices[i]['x'], 'y': vertices[i]['y']});
        mappingIsland(island, vertices[i]['x'], vertices[i]['y']);
      }else{
        vertices.removeAt(i);
      }
    }
  }
  /// mapea todas las casillas de una isla
  mappingIsland(List<Map> island, int x, int y){
    for(int i = x; i < size; i++){
      for(int j = y; j < size; j++){
        if(_mapIslands[i][j] == 1 && !isVertex(i,j)){
          if(i != 0 && inIsland(island, i-1, j) || j != 0 && inIsland(island, i, j-1)){
            island.add({'x': i, 'y': j});
          }else if(inIsland(island, i+1, j) || inIsland(island, i, j+1)){
            island.add({'x': i, 'y': j});
          }
        }
      }
    }
    islands.add(island);
  }
  /// busca si una casilla ya esta registrada en la isla indicada
 bool inIsland(List<Map> island, int x, int y){
    return island.any((element) => element['x'] == x && element['y'] == y);
 }
  /// valida si la posicion indicada pertece a una isla
  bool isInIslands(int x, int y){
    return islands.any((island) => inIsland(island, x, y));
  }
}