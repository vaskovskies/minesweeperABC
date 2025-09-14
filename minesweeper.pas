uses GraphABC,ABCObjects,ABCButtons;


var
  length: integer;
  width: integer;
  


var
  ar: array of integer;
  btnar:array of ButtonABC;
  shutar:array of ButtonABC;

function getn(x: integer; y: integer): integer;

begin
  Result := (x + (y * length - length));
end;

function getxyfromn(n:integer):(integer,integer);

begin
  Result:= (n mod width, n - (n mod width))
end;


function hasMine(x: integer; y: integer): boolean;

begin
  
  Result := (ar[getn(x, y)] = 10)
  
end;

function middle(x:integer;y:integer):integer;
  begin
    var n:=0;
      for var x1:=x-1 to x+1 do
      begin
        for var y1:=y-1 to y+1 do
          if HasMine(x1,y1) then
          begin
            n:= n+1;
          end;
          
      end;
    Result:=n;
    
  end;
function GenerateBoard(x: integer; y: integer; m: integer): array of integer;

begin
  
  length := x;
  width := y;
  
  
  SetLength(ar, x * y + 1);
  
  //places mines
  
  begin
    var n := 0;
    var mine: integer;
    repeat
      
      mine := Random(1, x * y);
      
      if not (ar[mine] = 10) then
      begin
        n := n + 1;
        ar[mine] := 10;
        
      end;
      
    until n = m;
  end;
  
  // places the numeric indicators (1s to 8s) that indicate where the mines are;
  
  //corners
  
  //left up
  begin
    var n := 0;
    if not (HasMine(1, 1)) then
    begin
      if HasMine(2, 1) then
      begin
        n := n + 1;
      end;
      if HasMine(1, 2) then
      begin
        n := n + 1;
      end;
      if HasMine(2, 2) then
      begin
        n := n + 1;
      end;
      ar[GetN(1, 1)] := n;
      
    end;
    
  end;
  //right up
  begin
    var n := 0;
    if not (HasMine(x, 1)) then 
    begin
      if HasMine(x - 1, 1) then
      begin
        n := n + 1;
      end;
      if HasMine(x, 2) then
      begin
        n := n + 1;
      end;
      if HasMine(x - 1, 2) then
      begin
        n := n + 1;
      end;
      ar[GetN(x, 1)] := n;
      
    end;
    
  end;
  
  //left down
  
  begin
    var n := 0;
    if not (HasMine(1, y)) then 
    begin
      if HasMine(1, y-1) then
      begin
        n := n + 1;
      end;
      if HasMine(2, y-1) then
      begin
        n := n + 1;
      end;
      if HasMine(2, y) then
      begin
        n := n + 1;
      end;
      ar[GetN(1, y)] := n;
      
    end;
    
  end;
  
  //right down
  
   begin
    var n := 0;
    if not (HasMine(x, y)) then 
    begin
      if HasMine(x, y-1) then
      begin
        n := n + 1;
      end;
      if HasMine(x-1, y-1) then
      begin
        n := n + 1;
      end;
      if HasMine(x-1, y) then
      begin
        n := n + 1;
      end;
      ar[GetN(x, y)] := n;
      
    end;
    
  end;
  
  //sides
  
  //up
  begin
  //writeln(x-1);
  for var i:=2 to x-1 do
  
  if not (HasMine(i,1)) then
    begin
    var n:integer:=0;
      if HasMine(i-1, 1) then
      begin
        n := n + 1;
      end;
     
      if HasMine(i+1, 1) then
      begin
        n := n + 1;
      end;
      
      if HasMine(i+1, 2) then
      begin
        n := n + 1;
      end;
      
      if HasMine(i, 2) then
      begin
        n := n + 1;
      end;
      
      if HasMine(i-1, 2) then
      begin
        n := n + 1;
      end;
      
      ar[getn(i,1)] := n;
      
     end;
  end;
  
  //down
    
  begin
  
  for var i:=2 to x-1 do
  
  if not (HasMine(i,y)) then
    begin
    var n:integer:=0;
      if HasMine(i-1, y) then
      begin
        n := n + 1;
      end;
     
      if HasMine(i+1, y) then
      begin
        n := n + 1;
      end;
      
      if HasMine(i+1, y-1) then
      begin
        n := n + 1;
      end;
      
      if HasMine(i, y-1) then
      begin
        n := n + 1;
      end;
      
      if HasMine(i-1, y-1) then
      begin
        n := n + 1;
      end;
      
      ar[getn(i,y)] := n;
      
     end;
  end;
  
    
  //left
  begin
  //writeln(y-1);
  for var i:=2 to y-1 do
  
  if not (HasMine(1,i)) then
    begin
    var n:integer:=0;
      if HasMine(1,i-1) then
      begin
        n := n + 1;
      end;
     
      if HasMine(1,i+1) then
      begin
        n := n + 1;
      end;
      
      if HasMine(2,i+1) then
      begin
        n := n + 1;
      end;
      
      if HasMine(2,i) then
      begin
        n := n + 1;
      end;
      
      if HasMine(2,i-1) then
      begin
        n := n + 1;
      end;
      
      ar[getn(1,i)] := n;
      
     end;
  end;
  
  
  //right
  
  begin
  
  for var i:=2 to y-1 do
  
  if not (HasMine(x,i)) then
    begin
    var n:integer:=0;
      if HasMine(x,i-1) then
      begin
        n := n + 1;
      end;
     
      if HasMine(x,i+1) then
      begin
        n := n + 1;
      end;
      
      if HasMine(x-1,i+1) then
      begin
        n := n + 1;
      end;
      
      if HasMine(x-1,i) then
      begin
        n := n + 1;
      end;
      
      if HasMine(x-1,i-1) then
      begin
        n := n + 1;
      end;
      
      ar[getn(x,i)] := n;
      
     end;
  end;
  
  
  
    
  //  
  //middle
  //wrap into function middle(x,y) that checks x-1 through x+1, y-1 through y-1 and returns n
  //we check if it's a mine and we go from x=2, y=2 to y-1 x-1
  begin
  //print(middle(2,2));
  for var x1:=2 to x-1 do
    for var y1:=2 to y-1 do
      begin
        if not (HasMine(x1,y1)) then
          begin
            ar[getn(x1,y1)]:=middle(x1,y1);
          end;
      end;
  end;
  
  Result := ar;
  
end;





begin
  var isReady:boolean;
  isReady:= false;
  
  var boardsizex,boardsizey,minen:integer;
  boardsizex:=10;
  boardsizey:=10;
  minen:=20;
  
  GenerateBoard(boardsizex, boardsizey, minen);
  SetLength(btnar,ar.Length);
  SetLength(shutar,ar.Length);
  
  var size:integer:=35;
  
  if true = false then
  begin
    var line: array of integer;
   SetLength(line, length);
    var wi: integer;
    for wi:=1 to width do
    begin
      writeln('');
     for var li := 1 to length do
        
        line[li - 1] := ar[getn(li, wi)];
      print(line);
    end;
    
 end;
 
 
 
 
 begin
   for var wI:=1 to width do
   for var lI:=1 to length do
   begin
   var Button:ButtonABC:= ButtonABC.Create(50 +size * lI,50 +size * wI ,size,size,ar[getn(lI,wI)].ToString,GColor.AliceBlue);
   begin
   if (ar[GetN(lI,wI)] = 0) then
     Button.Text:= ''
     else if ar[GetN(lI,wI)] = 10 then
      Button.Text:= 'B';
   end;
   Button.Visible:= False;
   btnar[getn(lI,wI)]:= Button;
   end;
   
 end;
 
 
 
 begin
     for var wI:=1 to width do
     for var lI:=1 to length do
     begin
     var Button:ButtonABC:= ButtonABC.Create(50 +size * lI,50 +size * wI ,size,size,'',GColor.BlanchedAlmond);
     Button.OnClick := procedure ->
     begin
       //if isReady = false then
       //begin;
         //repeat GenerateBoard(boardsizex,boardsizey,minen) until ar[GetN(lI,wI)] = 0;
         //Button.Visible:= false;
         //isReady:= true;
       //end;
       Button.Visible:= false;
     end;
     
     btnar[getn(lI,wI)].Visible:= True;
     shutar[getn(lI,wI)]:= Button;
     
     end;
   
 end;
 

 
 
 
 if true = false then
 begin
     for var wI:=1 to width do
     for var lI:=1 to length do
     begin
     var Button:= ShutAr[GetN(lI,wI)];
     Button.OnClick := procedure ->
     begin
     Button.Visible:= false;
     end;
     btnar[getn(lI,wI)].Visible:= True;
     shutar[getn(lI,wI)]:= Button;
     
     end;
   
 end;
 
end.