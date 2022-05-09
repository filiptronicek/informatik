async function sha512(str) {
    const buf = await crypto.subtle.digest("SHA-512", new TextEncoder("utf-8").encode(str));
    return Array.prototype.map.call(new Uint8Array(buf), x => (('00' + x.toString(16)).slice(-2))).join('');
}

const pwdHashes = {
    'prima': 'f3657c3361ea52128ecd6c753bf4dc10d64783a950c788bb0793ed890eab229160d9676dbfc347ee04429ebeeb7726d7f4e38c2e1f7d38d0fc146f4b65c4c3b9',
    'sekunda': 'c0cdf005fc9a7c209a157b5a726c05a24e57da568300ef284d0de66cecadb0a3a34e2155d792268023068fdf4bd207dbe48d48e24ad3a3402af5d992248016f5'
};

const validate = async (classEntered, password) => {
    const possibleClasses = ['prima', 'sekunda'];

    if (!possibleClasses.includes(classEntered)) {
        return false;
    }

    return (pwdHashes[classEntered] === await sha512(password))


}

const login = async () => {
    if (await validate(document.login.class.value, document.login.password.value))
        window.location.href = `./${document.login.class.value}.html`;
    else
        alert("Špatné přihlašovací údaje");
}

document.login.submit.onclick = () => login();
