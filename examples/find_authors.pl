#!/usr/bin/perl
use strict;
use LWP::UserAgent;
use Data::Dumper;

# http://event.perlukraine.org/upw2009/search?country=ua
# my $SITE   = 'http://event.perlukraine.org';
# my $SEARCH = "$SITE/upw2009/search?country=ua";

my $SITE   = 'http://www.perlworkshop.no';
my $SEARCH = "$SITE/npw2009/search?country=no";

my $UA = LWP::UserAgent->new(timeout => 5);

my   @url;
push @url, $UA->get(grep { warn$_ } $SEARCH.'&next=1&onext='. $_ * 20)->content =~ m{href="(/\w+/user/.*?)"}sg for 0..5;

my   @cpan;
push @cpan, $UA->get(grep { warn$_ } $SITE.$_)->content =~ m{href="(http://search.*?)"}sg for @url;

warn Dumper \@cpan;

__END__
Norway:

'http://search.cpan.org/author/SJN/',
'http://search.cpan.org/author/MRAMBERG/',
'http://search.cpan.org/author/KRN/',
'http://search.cpan.org/author/andremar/',
'http://search.cpan.org/author/TRONDMM/',
'http://search.cpan.org/author/ARNE/',
'http://search.cpan.org/author/eidolon/',
'http://search.cpan.org/author/NICOMEN/',
'http://search.cpan.org/author/COSIMO/',
'http://search.cpan.org/author/AFF/',
'http://search.cpan.org/author/ESPIZO/'

Ukraine:

'http://search.cpan.org/author/MVUETS/',
'http://search.cpan.org/author/DARKNOS/',
'http://search.cpan.org/author/vti/',
'http://search.cpan.org/author/dzhariy/'
