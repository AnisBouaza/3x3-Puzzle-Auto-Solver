import java.util.*;

int[] taille_grille = new int[2];
int[][] grille = new int[3][3];
int[] taille_pixel = new int[2];
PriorityQueue<Node> open = new PriorityQueue();
LinkedList<Node> closed = new LinkedList();
LinkedList<Node> path = new LinkedList();
boolean Trouver = false,solution = false;
int permute,x,yoink = 0;
long start,end;

// Starting Solvable Matrix
//int[][] startM = { {4,6,8},{2,7,5}, {0,3,1} };
//int[][] startM = { {1,2,8},{6,0,4}, {7,3,5} };
int[][] startM = { {4,6,8},{0,7,3}, {2,1,5} };
//int[][] startM = { {4,6,8},{7,3,5}, {2,0,1} };
//int[][] startM = { {4,6,8},{0,7,5}, {2,3,1} };

//Objective Matrix
int[][] objectifM = {  {1,2,3},{8,0,4}, {7,6,5} };

void setup()
{
  grille = startM;
  taille_grille[0] = 3;   //largeur grille
  taille_grille[1] = 3;   //hauteur grille
  taille_pixel[0] = 150;    //largeur pixel
  taille_pixel[1] = 150;    //hauteur pixel
  size(450, 600);         //(largeurpixel * largeur grille, hateurpixel * hauteur grille)
}


void draw()
{
  background(255);
  stroke(0);
  
  textAlign(CENTER, CENTER); 
  //println(NX+","+NY);
  for(int i = 0; i< taille_grille[0]; i++)
  {
   for( int j = 0; j<taille_grille[1]; j++)
   {
        x = grille[i][j];  
        switch (x)
        {
             case 0:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);
                   
               break;
            
             case 1:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("1",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);
               break;
             
             case 2:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("2",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);
               break;
             case 3:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("3",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);             
               break;
             case 4:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("4",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);             
               break;
             
             case 5:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("5",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);        
               break;
             
             case 6:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("6",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);
               break;
             
             case 7:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("7",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);
               break;
             
             case 8:
                   if(MatDif(grille,objectifM)) fill(255); else fill(0,255,0);
                   rect(j*taille_pixel[0], i*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
                   fill(0);
                   textSize(40);
                   text("8",j*taille_pixel[0]+taille_pixel[0]/2, i*taille_pixel[1]+taille_pixel[1]/2);
               break;
         
        }
   }
    int policeLegende = 30;
    textSize(policeLegende);
    if(height > width)
    {
      text("Time :"+str((end-start)/1000.0)+"\n" ,150, height-policeLegende);
      text("Steps :"+str(yoink) ,150, width + policeLegende);
    }
  }
   if(!path.isEmpty() && solution)
   {
     Node next_move = new Node();
     next_move = path.peek();
     int NY=FindY0(next_move.mat); int NX=FindX0(next_move.mat);
     fill(0,255,0);
     rect(NY*taille_pixel[0], NX*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
     fill(0);
     textSize(40);
     text(grille[NX][NY],NY*taille_pixel[0]+taille_pixel[0]/2, NX*taille_pixel[1]+taille_pixel[1]/2);
   }
   
}

  
void keyPressed()
{
  if( key == '1') {  start = System.currentTimeMillis(); Astar(); end = System.currentTimeMillis(); println("temp "+(end-start)/1000.0); solution = true;}
  
}

void mousePressed()
{
  int x1 = floor(mouseX/taille_pixel[0]);
  int y1 = floor(mouseY/taille_pixel[1]);
  if(MatDif(grille,objectifM))
  {
    if( mouseButton == LEFT )
    {

     if(x1+1 < taille_grille[0] && grille[y1][x1+1] == 0) 
     {
       if (solution) {
        if(!path.isEmpty() && x1 == FindY0(path.peek().mat) && y1 == FindX0(path.peek().mat)) path.pop();
         else
         {
           if(x1 != FindY0(path.peek().mat) || y1 != FindX0(path.peek().mat))
               {
                   Node reviens = new Node();
                   CopyMatrice(reviens.mat,grille);
                   path.push(reviens);
               }
         }}
         permute = grille[y1][x1];
         grille[y1][x1] = grille[y1][x1+1];
         grille[y1][x1+1] = permute;

     }
     
     if(x1-1 >= 0 && grille[y1][x1-1] == 0) 
     {
       if(solution) {
           if(!path.isEmpty() && x1 == FindY0(path.peek().mat) && y1 == FindX0(path.peek().mat)) path.pop();
           else
           {
             if( (x1 != FindY0(path.peek().mat) || y1 != FindX0(path.peek().mat)))
                 {
                     Node reviens = new Node();
                     CopyMatrice(reviens.mat,grille);
                     path.push(reviens);
                 }
           }
         }
         permute = grille[y1][x1];
         grille[y1][x1] = grille[y1][x1-1];
         grille[y1][x1-1] = permute;

     }
     
     
     if(y1+1 <taille_grille[1] && grille[y1+1][x1] == 0)
     {
       if (solution){
         if(!path.isEmpty() && x1 == FindY0(path.peek().mat) && y1 == FindX0(path.peek().mat))path.pop();
         else
         {
           if((x1 != FindY0(path.peek().mat) || y1 != FindX0(path.peek().mat)))
               {
                   Node reviens = new Node();
                   CopyMatrice(reviens.mat,grille);
                   path.push(reviens);
               }
         }}
         permute = grille[y1][x1];
         grille[y1][x1] = grille[y1+1][x1];
         grille[y1+1][x1] = permute;

     }
     
     
     if(y1-1 >= 0 && grille[y1-1][x1] == 0) 
     {
       if(solution){
         if(!path.isEmpty() && x1 == FindY0(path.peek().mat) && y1 == FindX0(path.peek().mat)) path.pop();
         else
         {
           if((x1 != FindY0(path.peek().mat) || y1 != FindX0(path.peek().mat)))
               {
                   Node reviens = new Node();
                   CopyMatrice(reviens.mat,grille);
                   path.push(reviens);
               }
         }}
         permute = grille[y1][x1];
         grille[y1][x1] = grille[y1-1][x1];
         grille[y1-1][x1] = permute;
 
     }
    }
  }
 
}
