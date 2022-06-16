program ExeBubbleSort;

var
  vetor: array [1 .. 100] of integer;
  I: integer;

procedure func_bubble();
var
  I, J, troca: integer;

begin

  I := 0;
  J := 0;
  troca := 0;

  for I := 1 to 100 do
  begin
    for J := I + 1 to 100 do
    begin
      if vetor[J] < vetor[I] then
      begin
        troca := vetor[I];
        vetor[I] := vetor[J];
        vetor[J] := troca;
      end;
    end;
  end;
end;

procedure func_selection();
var
  I, J, posicao_min, aux: integer;
begin

  I := 0;
  J := 0;
  aux := 0;
  posicao_min := 0;

  for J := 1 to 10 do
  begin
    posicao_min := J;
    for I := J to 10 do
    begin
      if vetor[I] < vetor[posicao_min] then
      begin
        posicao_min := I;

      end;
    end;
    if vetor[J] > vetor[posicao_min] then
    begin
      aux := vetor[J];
      vetor[J] := vetor[posicao_min];
      vetor[posicao_min] := aux;

    end;
  end;

end;

procedure func_insertion();
var
  I, J, troca, chave: integer;

begin

  I := 0;
  J := 0;
  troca := 0;
  chave := 0;

  for I := 1 to 10 do
  begin
    chave := vetor[I];
    J := I - 1;
    while ((J >= 1) and (vetor[J] > chave)) do
    begin
      troca := vetor[J];
      vetor[J] := vetor[J + 1];
      vetor[J + 1] := troca;
      J := J - 1;
    end;
    vetor[J + 1] := chave;
  end;
end;

procedure func_mergesort(a, b: integer);
var
  x, J, I, n1, n2: integer;
  vetor2: array [1 .. 100] of integer;
begin
  if b <= a then
    exit
  else
  begin
    x := ((a + b) div 2);
    func_mergesort(a, x);
    func_mergesort(x + 1, b);
    n1 := a;
    n2 := x + 1;
    for I := a to b do
    begin
      if (n1 < x + 1) and ((n2 > b) or (vetor[n1] < vetor[n2])) then
      begin
        vetor2[I] := vetor[n1];
        inc(n1);
      end
      else
      begin
        vetor2[I] := vetor[n2];
        inc(n2);
      end;
    end;
    for J := a to b do
      vetor[J] := vetor2[J];
  end;
end;

procedure func_quicksort(inicio, fim : integer);
var i, j, pivo, aux : integer;
begin
  i := inicio;
  j := fim;
  pivo := vetor[(inicio + fim) div 2];

  while (i <= j) do
  begin
    while (vetor[i] < pivo) and (i < fim) do
      i := i+1;

    while (vetor[j] > pivo) and (j > inicio) do
      j := j-1;

    if (i <= j) then
    begin
      aux := vetor[i];
      vetor[i] := vetor[j];
      vetor[j] := aux;
      i := i+1;
      j := j-1;
    end;
  end;

  if (j > inicio) then
    func_quicksort(inicio, j);

  if (i < fim) then
    func_quicksort(i, fim);
end;

    //Adicionando numeros randomicos aos vetores
begin
  randomize;
  for I := 1 to 100 do
  begin
    vetor[I] := random(1000);;
  end;

  // Função escolhida para ordernar os vetores
  func_quicksort(1, 100);

  // Varrendo os vetores e printando.
  writeln('Numeros ordenados');
  for I := 1 to 100 do
  begin
    writeln('Valor ', I, ': ', vetor[i]);
  end;
  readln;

end.