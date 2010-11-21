use v6;

class DOM::DocumentType { ... }
class DOM::Document { ... }

class DOM::DOMImplementation {
    method createDocumentType(
        Str $qualifiedName,
        Str $publicId,
        Str $systemId --> DOM::DocumentType)
    {
        return DOM::DocumentType.new();
    }

    method createDocument(
        Str $namespaceURI,
        Str $qualifiedName,
        DOM::DocumentType $doctype --> DOM::Document)
    {
        return DOM::Document.new(:localName($qualifiedName), :$doctype);
    }
}

class DOM::DocumentType {
}

role DOM::Node {
    has Str $.localName;
}

class DOM::Document does DOM::Node {
    has DOM::DocumentType $.doctype;
}
