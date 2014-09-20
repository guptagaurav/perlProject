use Tk;
use strict;
use File::Copy;
use File::Find::Rule;
use File::Find qw(finddepth);

my $INPUT=''; 

my $mw= new MainWindow;
$mw->geometry('600x300');
$mw->title("Executables and Graphics");

my $top_frame = $mw->Frame(-background => 'green')->pack(-ipady => 600, -side => "top", -fill => "x");
my $bottom_frame = $mw->Frame(-background => 'white')->pack(-ipady => 400, -side => "top", -fill => "x");
$mw->Label(-text => 'INPUT DIRECTORY PATH ')->place(-x=>250,-y=>100);
my $submit_entry= $mw->Entry(-background => 'white', -foreground => 'black', -width => 40)->place(-x=>200,-y=>150);
my $submit_button = $top_frame->Button(-text => "Submit",-command => \&submit_entry)->place(-x => 300, -y => 200);

###############
###############

sub submit_entry 
{
		$INPUT = $submit_entry->get();
		
		&input;
		
}

MainLoop;

sub input {

my $source_dir = $INPUT;
my $target_dir = $source_dir.'\Executables_and_Graphics';
mkdir $target_dir;

opendir(my $DIR, $source_dir) || die "can't opendir $source_dir: $!";  
my @files1;
 finddepth(sub {
      return if($_ eq '.' || $_ eq '..');
      push @files1, $File::Find::name;
 }, $source_dir);
foreach my $t (@files1)
{
my @arr=split("/",$t);
my $size=scalar(@arr);
my $i=1;
my $str="";
while($i<=$size-1){
$str=$str."/".$arr[$i];
$i=$i+1;}
my $result = $str =~ /.exe/||$str =~ /.png/||$str =~ /.jpg/;
  if($result eq 1)
  {
  my $filename= $target_dir."/".$arr[$size-1];
  if(-e $filename)
  {
 my ($name, $suffix) = $filename =~ /(.*)(\..*)/;
 my $ctr=1;
 $filename=$name."_$ctr".$suffix;
 while(-e $filename)
 {
 $ctr=$ctr+1;
 $filename=$name."_$ctr".$suffix;
 }
 if($ctr>1)
 {
 $ctr=$ctr-1;
 }
 $filename=$name."_$ctr".$suffix;
 print $filename."\n";
 copy $t,$filename;
  }
  else
  {
  copy $t, $filename;
  }
  }
 
  }
closedir($DIR);

}