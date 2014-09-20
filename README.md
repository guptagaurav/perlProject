FIND FILES - PERL

Gaurav Gupta
261/CO/11

Introduction

This is a project where we have to write a script that takes a directory name as its argument, creates a new sub-directory called executable and graphics within it, then scans the directory and all its sub-directories looking for executable and graphic files and moves them into the new sub-directory. In this project, we use the Perl Language and two of its module to achieve this objective.


Documentation

We have to follow the given steps in the order given below to use this problem statement - 
INSTALLATION
1) Install PERL

MACOSX

-> Run perl -v in the terminal to check the version of perl installed on the machine (perl is pre-installed in MACOSX).
LINUX

-> Run perl -v in the terminal to check the version of perl installed on the machine (perl is pre-installed in Linux).
WINDOWS

-> Go to www.padre.perlide.org to download Padre, the Perl IDE along with Strawberry Perl and install them on the machine.

2) Install Tk.

-> Go to your terminal ( PERL Command Line for windows ) and Type in:
     * cpan install Tk  - To install Tk Module
3) Copy the perlfinal.pl to a New Folder on your machine.
4) Browse to the above folder using the command line (terminal application).
5) Type in the following command in your terminal at this time : 
     * perl fileMover.pl  ¬- To run the perlfind.pl file
6) Enter the complete address of the folder  to be processed and the output can be seen in the same folder as that of the input file.


INSTRUCTIONS REGARDING FILE MOVER DEFINITION

In this problem, we use the following format for inputting a specific directory and then creating a Sub-Directory named ‘Executable and Graphics’:
my $source_dir = $INPUT;
my $target_dir = $source_dir.'\Executables and Graphics';
mkdir $target_dir;

Example : 

input = D:\Perl
then creating a sub-directory with command mkdir;
$target= D:\Perl\Executables and Graphics’;


then we will search for .exe, .jpg and .png files, like this 
$result = $str =~ /.exe/||$str =~ /.png/||$str =~ /.jpg/;
if($result eq 1)
then we have found the match and we’ll move them to executable and graphics folder.


