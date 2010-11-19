use v6;
use Test;

plan 2;

use DOM;

# Code adapted from
# http://se.php.net/manual/en/domimplementation.createdocument.php
my $document
    = DOMImplementation.createDocument(Str, 'html',
        DOMImplementation.createDocumentType('html',
            '-//W3C//DTD XHTML 1.0 Transitional//EN',
            'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'));

isa_ok $document, Document, "the document is a Document";
isa_ok $document.doctype, DocumentType, "the doctype is a DocumentType";

my $html = $document.documentElement;
my $head = $document.createElement('head');
my $title = $document.createElement('title');
my $text = $document.createTextNode('Title of Page');
my $body = $document.createElement('body');

$title.appendChild($text);
$head.appendChild($title);
$html.appendChild($head);
$html.appendChild($body);

$document.Str();
