unit UTaxService;

interface

type
  ITaxService = interface
    //CTRL+SHIFT+G
    ['{02AA71C8-2E43-451E-8E8A-49FBF9578E90}']

    function Tax(const aAmount: Double): Double;
  end;

implementation

end.
