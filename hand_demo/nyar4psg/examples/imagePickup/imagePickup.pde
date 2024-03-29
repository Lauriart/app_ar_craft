/**
 * NyARToolkit for proce55ing/3.0.5
 * (c)2008-2017 nyatla
 * airmail(at)ebony.plala.or.jp
 * 
 * ARマーカと同じ平面からマーカパターンを得る事ができます。
 * Hiroマーカを使います。
 * 全ての設定ファイルとマーカファイルはスケッチディレクトリのlibraries/nyar4psg/dataにあります。
 * 
 * This program gets the image from around the marker.
 * The marker file is "patt.hiro"
 * Any pattern and configuration files are found in libraries/nyar4psg/data inside your sketchbook folder.  
 */
import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;


void setup() {
  size(640,480,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,640,480);
  nya=new MultiMarker(this,width,height,"../../data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("../../data/patt.hiro",80);//id=0
  cam.start();
  
}

int c=0;
void draw()
{
  c++;
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  if((!nya.isExist(0))){
    return;
  }
  PImage pm=nya.pickupRectImage(0,-40,-40,80,80,100,100);
  //以下のコードと意味は同じです。 The meaning of this code is the same as the next lines. 
  //PImage pm=nya.pickupMarkerImage(0,40,40,-40,40,-40,-40,40,-40,100,100);
  image(pm,0,0);
}