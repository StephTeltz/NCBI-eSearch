#!/usr/bin/perl

# PROJECT:	NCBI e-Search
# AUTHOR:	Steph Teltz (teltzs@gmail.com)
# DATE:		25 January 2017

use DBI;					# Perl Database Interface
use LWP::Simple;			# Perl Library for WWW (for getting HTML)
use LWP::Protocol::https;	# Perl Library for WWW (https)

my ($ncbi_baseurl, $ncbi_query, $ncbi_esearch, $db, $query, $ncbi_result);

$db="pubmed";														# Name of database to query
# Example: Get the PubMed IDs (PMIDs) for articles about breast cancer published in Science in 2008
$query="science[journal]+AND+breast+cancer+AND+2008[pdat]";			# Search query

# Initialize variables  
$ncbi_baseurl = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/";	# Base URL for Entrez calls
$ncbi_query = "esearch.fcgi?db=$db&term=$query";				  	# Base Entrez query	

# Construct Entrez URL call 
$ncbi_esearch = $ncbi_baseurl . $ncbi_query;

# Try getting the results of the query
$ncbi_result = get $ncbi_esearch
#getprint $ncbi_esearch
	or die "Could not get results at " . '$absolute_url';

print $ncbi_result;

# works!! after LWP::Protocol::https install
#my $absolute_url = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=science%5bjournal%5d+AND+breast+cancer+AND+2008%5bpdat%5d';
#getprint $absolute_url
#	or die "Could not get results at " . '$absolute_url';


# works!!
#getprint 'http://www.perl.com/pub/2002/08/20/perlandlwp.html'
#	or die "Could not get results at "; #. "$ncbi_esearch";



