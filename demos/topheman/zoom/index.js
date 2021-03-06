(function(){

function init(){
    
    //init canvas and world
    canvas = document.getElementById("canvas");
    myWorld = boxbox.createWorld(canvas,{scale:20, preventScroll:false, disableTouchEvents : false, disableKeyEvents : true, disableMouseEvents : false, debugDraw:false});
    
    //create entities
    left = myWorld.createEntity({
      color: "orange",
      x: 4,
      y: 2,
      width: 5,
      height: 6
    });
    left.name('left');

    right = myWorld.createEntity({
        x: 20,
        y: 0,
      width: 5,
      height: 6
    });
    right.name('right');
    
    center = myWorld.createEntity({
        color : 'red',
        x: 12,
        y: 0,
        width: 5,
        density: 10,
        height: 7
    });
    center.name('center');

    ground = myWorld.createEntity({
      color: "green",
      x: 17,
      y: 14,
      width: 30,
      height: 0.5,
      type: "static"
    });
    ground.name('ground');

    ground2 = myWorld.createEntity({
      color: "green",
      x: 12,
      y: 16,
      width: 5,
      height: 0.5,
      type: "static"
    });
    ground2.name('ground2');
    
    points = [
          {x:-5,y:0},
          {x:0,y:-2},
          {x:5,y:0},
          {x:5,y:5},
          {x:0,y:5}
      ];
    
    polygon = myWorld.createEntity({
      shape : 'polygon',
      x: 24,
      y: 0,
      points: points
    });
    polygon.name('polygon');
    
    left.mouseDraggable({
        start:function(e,mouseInfos){
            console.info('draggable-start',e,mouseInfos);
        },
        drag:function(e,mouseInfos){
            console.info('draggable-drag',e,mouseInfos);
        },
        stop:function(e,mouseInfos){
            console.info('draggable-stop',e,mouseInfos);
        }
    });
    center.mouseDraggable();
    
    myWorld.mousePan({
        start:function(e,viewportInfos){
            console.info('pan-start',viewportInfos);
        },
        drag:function(e,viewportInfos){
            console.info('pan-drag',e,viewportInfos);
        },
        stop:function(e,viewportInfos){
            console.info('pan-stop',e,viewportInfos);
        },
        excludeEntityIds:[
            1
        ]
    });
    
    right.onMousewheel(function(e,mouseWheelInfos){
//        console.info('right - mousewheel',e,mouseWheelInfos);
        if(mouseWheelInfos.delta === 1){
            this.color('red');
        }
        if(mouseWheelInfos.delta === -1){
            this.color('green');
        }
    });
    
    myWorld.onMousewheel(function(e,mouseWheelInfos){
//        console.info('world - mousewheel',e,mouseWheelInfos);
    });
    
    myWorld.mousewheelZoom({step:1});

}   

init();

})();