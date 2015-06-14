
class Compiler {
  public:
    static Compiler & getInstance();

  private:
    Compiler() {};

    Compiler(Compiler const&);
    void operator=(Compiler const&);
};
