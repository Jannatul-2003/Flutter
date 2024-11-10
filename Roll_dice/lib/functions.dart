//file:///C:/Higher%20Study/Udemy_Flutter/02%20-%20Flutter%20&%20Dart%20Basics%20I%20-%20Getting%20a%20Solid%20Foundation%20[ROLL%20DICE%20APP]/012%20Deep%20Dive%20Position%20&%20Named%20Arguments.html

void add({num1,num2=5})
{
  num1+num2;
}
void demo()
{
  add(num1: 2,num2: 3);
  add();
  add(num1: 2);
  subtract(200, 100);
  //subtract();
}
void subtract(num1,[num2=2]){
  print(num1-num2.toString());
}
void multiply(num1,[num2]){
  print(num1*num2);
}