// dette er min liste til mine bolde
ArrayList<bold> boldliste = new ArrayList<bold>();

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  // denne for-løkke går igennem alle bolde i boldliste og kalder dem på skift 'b'. Derved kan man bruge de erklærede metoder på de enkelte bolde.
  for (bold b : boldliste) {
    b.tegn();
  }
}

void mousePressed() {
  boldliste.add(new bold(mouseX, mouseY, 20));
}
