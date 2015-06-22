
/**upload_json.php
 *
 */

require_once 'JSON.php';

$php_path = dirname(__FILE__) . '/';
$php_url = dirname($_SERVER['PHP_SELF']) . '/';

//�ļ�����Ŀ¼·��
$save_path = $php_path . '../attached/';
//�ļ�����Ŀ¼URL
$save_url = $php_url . '../attached/';
//���������ϴ����ļ���չ��
$ext_arr = array(
	'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
	'flash' => array('swf', 'flv'),
	'media' => array('swf', 'flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb'),
	'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2'),
);
//����ļ���С
$max_size = 1000000;

$save_path = realpath($save_path) . '/';

//PHP�ϴ�ʧ��
if (!empty($_FILES['imgFile']['error'])) {
	switch($_FILES['imgFile']['error']){
		case '1':
			$error = '����php.ini����Ĵ�С��';
			break;
		case '2':
			$error = '����������Ĵ�С��';
			break;
		case '3':
			$error = 'ͼƬֻ�в��ֱ��ϴ���';
			break;
		case '4':
			$error = '��ѡ��ͼƬ��';
			break;
		case '6':
			$error = '�Ҳ�����ʱĿ¼��';
			break;
		case '7':
			$error = 'д�ļ���Ӳ�̳���';
			break;
		case '8':
			$error = 'File upload stopped by extension��';
			break;
		case '999':
		default:
			$error = 'δ֪����';
	}
	alert($error);
}

//���ϴ��ļ�ʱ
if (empty($_FILES) === false) {
	//ԭ�ļ���
	$file_name = $_FILES['imgFile']['name'];
	//����������ʱ�ļ���
	$tmp_name = $_FILES['imgFile']['tmp_name'];
	//�ļ���С
	$file_size = $_FILES['imgFile']['size'];
	//����ļ���
	if (!$file_name) {
		alert("��ѡ���ļ���");
	}
	//���Ŀ¼
	if (@is_dir($save_path) === false) {
		alert("�ϴ�Ŀ¼�����ڡ�");
	}
	//���Ŀ¼дȨ��
	if (@is_writable($save_path) === false) {
		alert("�ϴ�Ŀ¼û��дȨ�ޡ�");
	}
	//����Ƿ����ϴ�
	if (@is_uploaded_file($tmp_name) === false) {
		alert("�ϴ�ʧ�ܡ�");
	}
	//����ļ���С
	if ($file_size > $max_size) {
		alert("�ϴ��ļ���С�������ơ�");
	}
	//���Ŀ¼��
	$dir_name = empty($_GET['dir']) ? 'image' : trim($_GET['dir']);
	if (empty($ext_arr[$dir_name])) {
		alert("Ŀ¼������ȷ��");
	}
	//����ļ���չ��
	$temp_arr = explode(".", $file_name);
	$file_ext = array_pop($temp_arr);
	$file_ext = trim($file_ext);
	$file_ext = strtolower($file_ext);
	//�����չ��
	if (in_array($file_ext, $ext_arr[$dir_name]) === false) {
		alert("�ϴ��ļ���չ���ǲ��������չ����\nֻ����" . implode(",", $ext_arr[$dir_name]) . "��ʽ��");
	}
	//�����ļ���
	if ($dir_name !== '') {
		$save_path .= $dir_name . "/";
		$save_url .= $dir_name . "/";
		if (!file_exists($save_path)) {
			mkdir($save_path);
		}
	}
	$ymd = date("Ymd");
	$save_path .= $ymd . "/";
	$save_url .= $ymd . "/";
	if (!file_exists($save_path)) {
		mkdir($save_path);
	}
	//���ļ���
	$new_file_name = date("YmdHis") . '_' . rand(10000, 99999) . '.' . $file_ext;
	//�ƶ��ļ�
	$file_path = $save_path . $new_file_name;
	if (move_uploaded_file($tmp_name, $file_path) === false) {
		alert("�ϴ��ļ�ʧ�ܡ�");
	}
	@chmod($file_path, 0644);
	$file_url = $save_url . $new_file_name;

	header('Content-type: text/html; charset=UTF-8');
	$json = new Services_JSON();
	echo $json->encode(array('error' => 0, 'url' => $file_url));
	exit;
}

function alert($msg) {
	header('Content-type: text/html; charset=UTF-8');
	$json = new Services_JSON();
	echo $json->encode(array('error' => 1, 'message' => $msg));
	exit;
}
