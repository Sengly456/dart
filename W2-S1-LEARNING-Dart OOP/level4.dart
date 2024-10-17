
import 'dart:typed_data';

class Distance{
  final double cms;
  final double meters;
  final double kms;

  Distance(this.cms,this.meters,this.kms);

  Distance operator +(Distance other){
    return Distance(this.cms+other.cms,this.meters+other.meters,this.kms+other.kms);
  }
  Distance.kms(double kms)
    : this.cms = kms * 100000, 
      this.meters = kms * 1000,
      this.kms = kms;
  
  Distance.meters(double meters)
    : this.cms = meters * 100,
      this.meters = meters,
      this.kms = meters / 1000;
  Distance.cms(double cms)
    : this.cms=cms,
      this.meters=cms/100,
      this.kms=cms/100000;

}
void main(){
  Distance d1=Distance.kms(3.4);
  Distance d2=Distance.meters(1000);
  print((d1+d2).kms);
}