use v6;

class DocumentType { ... }
class Document { ... }

class DOMImplementation {
    our method createDocumentType(
        Str $qualifiedName,
        Str $publicId,
        Str $systemId --> DocumentType)
    {
        return DocumentType.new();
    }

    our method createDocument(
        Str $namespaceURI,
        Str $qualifiedName,
        DocumentType $doctype --> Document)
    {
        return Document.new();
    }
}

class DocumentType {
}

class Document {
    has DocumentType $.doctype;

    submethod BUILD() {
        $!doctype = DocumentType.new();
    }
}
