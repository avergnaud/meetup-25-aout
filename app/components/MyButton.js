'use client';

import { useState } from "react";
import { useRouter } from "next/navigation";

export default function MyButton() {

    const [myText, setMyText] = useState('Initial input');
    const router = useRouter();

    const handleOnChange = (event) => {
        setMyText(event.target.value);
    };
// javascript:(alert)(3)
// javascript:(debugger)
// javascript:(console.log)('toto')
// javascript:(console.log)(document.cookie)
    return (
        <>
            <h2>Router Demo</h2>
            <div>
                <form>
                    <div>
                        <label htmlFor="mytext">Todo</label>
                        <div>
                            <input
                                id="mytext"
                                type="text"
                                value={myText}
                                onChange={handleOnChange}
                                required
                            />
                        </div>
                    </div>
                    <div>
                        <button onClick={() => router.push(myText)}>Click</button>
                    </div>
                </form>
            </div>
        </>
    );

};