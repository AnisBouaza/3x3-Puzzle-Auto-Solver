
//Trouver X0

int FindX0(int[][] Matrice)
{
    int x0=0;
    for(int i = 0; i< taille_grille[0]; i++)
    {
     for( int j = 0; j<taille_grille[1]; j++)
      {
           if (Matrice[i][j]==0) x0 = i;
      }
         
    }
  
    return x0;

}


//Trouver Y0
int FindY0(int[][] Matrice)
{
    int y0=0;
    for(int i = 0; i< taille_grille[0]; i++)
    {
     for( int j = 0; j<taille_grille[1]; j++)
      {
           if (Matrice[i][j]==0) y0 = j;
      }
         
    }
  
    return y0;

}

// Compare deux matrice (retourne vrai si differente)
boolean MatDif(int[][] Matrice1,int[][] Matrice2)
{
  for(int i = 0; i< taille_grille[0]; i++)
  {
     for( int j = 0; j<taille_grille[1]; j++)
      {
           if (Matrice1[i][j]!= Matrice2[i][j]) return true;
      }
         
   }
  return false;
}

// Met une matrice dans une autre
void CopyMatrice(int[][] Matrice1,int[][] Matrice2)
{
    for(int i = 0; i< taille_grille[0]; i++)
  {
     for( int j = 0; j<taille_grille[1]; j++)
      {
           Matrice1[i][j]= Matrice2[i][j];
      }
         
   }
}

// Calculer l'heuristique
int CalculeH(int[][] matrice)
{
    int score=0;
  
  
      for(int i = 0; i< taille_grille[0]; i++)
        {
         for( int j = 0; j<taille_grille[1]; j++)
         {
             if (matrice[i][j] != objectifM[i][j]) score = score +1;
         }
         
        }
  
  return score;
  
}


// Crée les voisins d'un noeud
void CreeVoisins(Node courant)
{    
    int x0 = FindX0(courant.mat);
    int y0 = FindY0(courant.mat);
   
     /// x+1
     if( x0+1 < taille_grille[0] )
     { 
       Node voisin = new Node();
       CopyMatrice(voisin.mat,courant.mat);
       voisin.mat[x0][y0] = voisin.mat[x0+1][y0];
       voisin.mat[x0+1][y0] = 0;
       voisin.cout = courant.cout + 1;
       voisin.F = voisin.cout + CalculeH(voisin.mat);
       voisin.pere = courant;
       open.add(voisin);
     }
  
     /// x-1
     if(x0-1 >= 0 )
     {
       Node voisin = new Node();
       CopyMatrice(voisin.mat,courant.mat);
       voisin.mat[x0][y0] = voisin.mat[x0-1][y0];
       voisin.mat[x0-1][y0] = 0;
       voisin.cout = courant.cout + 1;
       voisin.F = voisin.cout + CalculeH(voisin.mat);
       voisin.pere = courant;
       open.add(voisin);
     }
     
     /// y+1
     if(y0+1 <taille_grille[1])
     {
       Node voisin = new Node();
       CopyMatrice(voisin.mat,courant.mat);
       voisin.mat[x0][y0] = voisin.mat[x0][y0+1];
       voisin.mat[x0][y0+1] = 0;
       voisin.cout = courant.cout + 1;
       voisin.F = voisin.cout + CalculeH(voisin.mat);
       voisin.pere = courant;
       open.add(voisin);
     }
     
     
     /// y-1
     if(y0-1 >= 0)
     {
       Node voisin = new Node();
       CopyMatrice(voisin.mat,courant.mat); 
       voisin.mat[x0][y0] = voisin.mat[x0][y0-1];
       voisin.mat[x0][y0-1] = 0;
       voisin.cout = courant.cout + 1;
       voisin.F = voisin.cout + CalculeH(voisin.mat);
       voisin.pere = courant;
       open.add(voisin);
     }
}
