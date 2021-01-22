void Astar()
{
  
  // init courant
  Node Courant = new Node();
  Courant.mat = startM;
  Courant.F = CalculeH(startM);
  open.add(Courant);
  Node Dernier = new Node();
  int it=0;
  while(!open.isEmpty() && !Trouver)
  {
    Courant = open.poll();
    if(!MatDif(Courant.mat,objectifM))
    {
      Dernier = Courant;
      Trouver = true; 
    }
    else
    {
     if(!closed.contains(Courant)) {CreeVoisins(Courant); closed.add(Courant);}
    }
    
    it++;
  }
  


  Courant = Dernier;
  if( Trouver == true)
  {
    while( Courant.pere != null )
    {
        path.push(Courant);
        Courant = Courant.pere;
        yoink++;
    }
  }

}
