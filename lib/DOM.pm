use v6;

class DOM::DocumentType { ... }
class DOM::Document { ... }

class DOM::DOMImplementation {
    our method createDocumentType(
        Str $qualifiedName,
        Str $publicId,
        Str $systemId --> DOM::DocumentType)
    {
        return DOM::DocumentType.new();
    }

    our method createDocument(
        Str $namespaceURI,
        Str $qualifiedName,
        DOM::DocumentType $doctype --> DOM::Document)
    {
        return DOM::Document.new(:$doctype);
    }
}

class DOM::DocumentType {
}

class DOM::Document {
    has DOM::DocumentType $.doctype;
}
