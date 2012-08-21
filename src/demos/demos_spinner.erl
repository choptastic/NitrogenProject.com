-module (demos_spinner).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).

main() -> #template { file="./templates/demos46.html" }.

title() -> "Spinner".

headline() -> "Spinner".

left() -> 
    [
        "
        <p>
        Spinner is automatically shown on a start of AJAX event and hidden
        when it finishes.

        <p>
        In this demo, the 'Translate' button is wired to update the content of
        the textbox. The update is deliberately delayed to demonstrate
        spinner function.
        ", 
        linecount:render() 
    ].

right() -> 
    [
	#textbox { id=theMessage, text="Hello, world!", next=theButton },
	#button { id=theButton, text="Translate", postback=click },
	#p{},
	#spinner{}
    ].

event(click) ->
    timer:sleep(2000),
    wf:set(theMessage, "Ahoj světe!"),
    ok;	

event(_) -> ok.
