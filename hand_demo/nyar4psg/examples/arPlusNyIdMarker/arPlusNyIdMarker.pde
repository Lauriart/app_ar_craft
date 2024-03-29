/**
 * NyARToolkit for proce55ing/3.0.5
 * (c)2008-2017 nyatla
 * airmail(at)ebony.plala.or.jp
 * 
 * ARマーカとIdマーカを同時に使う例です。
 * このスケッチはARマーカのkanji,hiroと、idマーカは0,1番のマーカを使います。
 * 全ての設定ファイルとマーカファイルはスケッチディレクトリのlibraries/nyar4psg/dataにあります。
 * 
 * This sample handles 2 ARToolkit style markers and 2 NyId markers at same time.
 * The sketch uses ARToolKit standard marker files(kanji.patt,hiro.patt) and NyIdMarker(#0 and #1).
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
  nya.addARMarker("../../data/patt.kanji",80);//id=1
  nya.addNyIdMarker(0,80);//id=2
  nya.addNyIdMarker(1,80);//id=3
  cam.start();
}

void draw()
{
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  for(int i=0;i<4;i++){
    if((!nya.isExist(i))){
      continue;
    }
    nya.beginTransform(i);
    fill(100*(((i+1)/4)%2),100*(((i+1)/2)%2),100*(((i+1))%2));
    translate(0,0,20);
    box(40);
    nya.endTransform();
  }
}